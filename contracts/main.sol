pragma solidity ^0.4.0;
import "linear_model/perceptron.sol";


contract Main is Perceptron{
    function test() public returns (uint)
    {
        N = 2;
        rate = double_t(1, 0);
        double [] memory W = new double[](N);
        for(uint v; v < 2;v++)
        {
            W[v] = double_t(1, 0);
        }

        double [][] memory data = new double[][](4);
        data[0] = reshape_int([int(0), 1]);
        data[1] = reshape_int([int(1), 0]);
        data[2] = reshape_int([int(0), 0]);
        data[3] = reshape_int([int(1), 1]);

        double [] memory output = new double [](4);
        output[0] = double_t(1, 0);
        output[1] = double_t(1, 0);
        output[2] = double_t(0, 0);
        output[3] = double_t(0, 0);
        for(uint e; e < 2;e++){
        W = train_on_data(data, output, W);
        }

        double [] memory test = new double[](2);
        test[0] = double_t(1, 0);
        test[1] = double_t(0, 0);
        return convert(predict(test, W));
        //return 1;
    }
}

