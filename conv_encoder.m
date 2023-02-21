function [pbits, bits] = conv_encoder(inputs)
    % position bits 
    A = inputs; B = inputs;
    A(end) = [];
    pbits = [0 A];
    % polarity bit
    B(end) = []; B(end) = [];
    bits = xor([[0 0] B], inputs);