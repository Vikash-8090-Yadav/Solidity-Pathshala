// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/IUniswapV2Router02.sol";
import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/IWETH9.sol";

contract Trade is Ownable {
    address private uniswapV2RouterAddress;
    address payable wethAddress;
    address private factoryAddress;

    constructor(address _routerAddress) {
        uniswapV2RouterAddress = _routerAddress;
        wethAddress = payable(IUniswapV2Router02(uniswapV2RouterAddress).WETH());
        factoryAddress = IUniswapV2Router02(uniswapV2RouterAddress).factory();
    }

    function _unwrapWETH() private {
        uint256 balance = IWETH9(wethAddress).balanceOf(address(this));
        require(balance > 0, "Insufficient balance");
        IWETH9(wethAddress).withdraw(balance);
    }

    function withdrawETH() public onlyOwner {
        _unwrapWETH();
        _withdrawETHTo(owner());
    }

    function _withdrawETHTo(address to) private {
        uint value = address(this).balance;

        (bool success, ) = to.call{value: value}("");
        require(success, "Withdraw failed");
    }

    function unwrapWETH() public onlyOwner {
        _unwrapWETH();
    }

    function withdrawTokens(address _token) external onlyOwner {
        uint balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(owner(), balance);
    }

    function swapEthToTokens(
        address _token,
        address _to,
        uint _deadline
    ) public payable onlyOwner {
        address[] memory path = new address[](2);
        path[0] = wethAddress;
        path[1] = _token;

        uint[] memory amountOutMin = IUniswapV2Router02(uniswapV2RouterAddress)
            .getAmountsOut(msg.value, path);

        IUniswapV2Router02(uniswapV2RouterAddress).swapExactETHForTokens{
            value: msg.value
        }(amountOutMin[1], path, _to, _deadline);
    }

    // Please make sure you have tokens in your smart contract i.e address(this) before calling this function
    function swapTokensToEth(
        address _token,
        address _to,
        uint _deadline
    ) public onlyOwner {
        address[] memory path = new address[](2);
        path[0] = _token;
        path[1] = wethAddress;

        uint _amountIn = IERC20(_token).balanceOf(address(this));

        uint[] memory amountOutMin = IUniswapV2Router02(uniswapV2RouterAddress)
            .getAmountsOut(_amountIn, path);

        IERC20(_token).approve(uniswapV2RouterAddress, _amountIn);

        IUniswapV2Router02(uniswapV2RouterAddress).swapExactTokensForETH(
            _amountIn,
            amountOutMin[1],
            path,
            _to,
            _deadline
        );
    }

    // Please make sure you have tokens in your smart contract i.e address(this) before calling this function
    function swapTokensToTokens(
        address _tokenIn,
        address _tokenOut,
        address _to,
        uint _deadline
    ) public onlyOwner {
        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        uint _amountIn = IERC20(_tokenIn).balanceOf(address(this));

        uint[] memory amountOutMin = IUniswapV2Router02(uniswapV2RouterAddress)
            .getAmountsOut(_amountIn, path);

        IERC20(_tokenIn).approve(uniswapV2RouterAddress, _amountIn);

        IUniswapV2Router02(uniswapV2RouterAddress).swapExactTokensForTokens(
            _amountIn,
            amountOutMin[1],
            path,
            _to,
            _deadline
        );
    }

    receive() external payable { }

}