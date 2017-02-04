pragma solidity ^0.4.0;

import "../utils/multiprecision.sol";

contract Perceptron is Double
{
    uint N;
    double rate;
    //double [] W;
    function f(double x) internal returns (double)
    {
        if(double_lt(x, double_t(0,0))) return double_t(0, 0);
        return double_t(1, 0);
    }

    function predict(double [] data, double [] W) internal returns (double)
    {
        double memory S;
        for(uint i;i < N;i++)
        {
            S = double_add(S, double_mult(W[i], data[i]));
        }
        return f(S);
    }

    function train(double [] input, double output, double [] W) internal returns (double [])
    {
        double memory err;
        for(uint i;i < N;i++)
        {
            err = double_sub(output, predict(input, W));
            W[i] = double_add(W[i], double_mult(double_mult(err, input[i]), rate));
        }
        return W;
    }

    function train_on_data(double [][] data, double [] output, double [] W) internal returns (double [])
    {
        for(uint i;i < data.length;i++)
        {
           W = train(data[i], output[i], W);
        }
        return W;
    }
}