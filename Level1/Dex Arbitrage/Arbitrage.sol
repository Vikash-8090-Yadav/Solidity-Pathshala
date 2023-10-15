//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/IWETH9.sol";
import "./interfaces/IUniswapV2Router02.sol";

contract Arb is Ownable, ReentrancyGuard {
    address payable private wethAddress;

    constructor(address _wethAddress)
        //  Ownable(msg.sender) 
    // Uncomment above line if you get this error - No arguments passed to the base constructor. Specify the arguments or mark "Arb" as abstract
    {
        wethAddress = payable(_wethAddress);
    }

    function _swapTokens(
        address _router,
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn,
        uint256 _amountOutMin,
        uint256 _deadline
    ) private {
        IUniswapV2Router02 routerContract = IUniswapV2Router02(_router);
        IERC20(_tokenIn).approve(_router, _amountIn);
        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        routerContract.swapExactTokensForTokens(
            _amountIn,
            _amountOutMin,
            path,
            address(this),
            _deadline
        );
    }

    function getExpectedAmountOut(
        address _router,
        address[] memory path,
        uint256 _amountIn
    ) public view returns (uint256) {
        IUniswapV2Router02 routerContract = IUniswapV2Router02(_router);
        uint256[] memory amountOutMins = routerContract.getAmountsOut(
            _amountIn,
            path
        );
        return amountOutMins[path.length - 1];
    }

    function dualDexTrade(
        address _router1,
        address _router2,
        address _token1,
        address _token2,
        uint256 _amountIn,
        uint256 _deadline
    ) external onlyOwner() nonReentrant() {
        uint256 token1BalanceBeforeSwap = IERC20(_token1).balanceOf(
            address(this)
        );

        uint256 token2BalanceBeforeSwap = IERC20(_token2).balanceOf(
            address(this)
        );

        address[] memory path = new address[](2);
        path[0] = _token1;
        path[1] = _token2;

        uint256 expectedToken2Output = getExpectedAmountOut(
            _router1,
            path,
            _amountIn
        );

        _swapTokens(
            _router1,
            _token1,
            _token2,
            _amountIn,
            expectedToken2Output,
            _deadline
        );

        uint256 token2BalanceAfterSwap = IERC20(_token2).balanceOf(
            address(this)
        );

        uint256 swappedToken2Balance = token2BalanceAfterSwap -
            token2BalanceBeforeSwap;

        path[0] = _token2;
        path[1] = _token1;

        uint256 expectedToken1Output = getExpectedAmountOut(
            _router2,
            path,
            swappedToken2Balance
        );

        _swapTokens(
            _router2,
            _token2,
            _token1,
            swappedToken2Balance,
            expectedToken1Output,
            _deadline
        );

        uint256 token1BalanceAfterSwap = IERC20(_token1).balanceOf(
            address(this)
        );

        require(token1BalanceAfterSwap > token1BalanceBeforeSwap, "No Profit");
    }

    function _unwrapWETH() private {
        uint256 balance = IWETH9(wethAddress).balanceOf(address(this));
        require(balance > 0, "Insufficient balance");
        IWETH9(wethAddress).withdraw(balance);
    }

    function withdrawETH() public onlyOwner() nonReentrant() {
        try
            IWETH9(wethAddress).withdraw(
                IWETH9(wethAddress).balanceOf(address(this))
            )
        {} catch {}

        _withdrawETHTo(owner());
    }

    function _withdrawETHTo(address to) private {
        uint256 value = address(this).balance;

        (bool success, ) = to.call{value: value}("");
        require(success, "Withdraw failed");
    }

    function unwrapWETH() public onlyOwner() nonReentrant() {
        _unwrapWETH();
    }

    function withdrawTokens(address _token) external onlyOwner() nonReentrant() {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(owner(), balance);
    }

    receive() external payable {}

    fallback() external payable {}
}
