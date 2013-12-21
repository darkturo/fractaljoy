require "lunit"
module( "complex_test", lunit.testcase )
local math = require "math"
local fractaljoy = require "fractaljoy.complex"

function test_should_be_zero_by_default()
    local complex = fractaljoy.ComplexNumber:new()
    assert_equal(0.0, complex.r)
    assert_equal(0.0, complex.i)
end

function test_initialization_with_only_real_part_is_allowed()
    local complex = fractaljoy.ComplexNumber:new({r = 1.0})
    assert_equal(1.0, complex.r)
    assert_equal(0.0, complex.i)
end

function test_initialization_with_only_imaginary_part_is_allowed()
    local complex = fractaljoy.ComplexNumber:new({i = -1.5})
    assert_equal(0.0, complex.r)
    assert_equal(-1.5, complex.i)
end

function test_set_fields_after_initilization_is_allowed()
    local  complex = fractaljoy.ComplexNumber:new()
    assert_equal(0.0, complex.r)
    assert_equal(0.0, complex.i)
    complex.r = 3.0
    complex.i = 5.9
    assert_equal(3.0, complex.r)
    assert_equal(5.9, complex.i)
    complex.r = -2.5
    assert_equal(-2.5, complex.r)
    assert_equal(5.9, complex.i)
    complex.i = 2.5
    assert_equal(-2.5, complex.r)
    assert_equal(2.5, complex.i)
end

function test_compare_two_equal_complex_numbers_using_equal_operator()
    local complex1 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.5})
    local complex2 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.5})
    assert_true(complex1 == complex2)
end

function test_comparisson_between_two_different_complex_numbers_is_expected_to_be_false()    
    local complex1 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.5})
    local complex2 = fractaljoy.ComplexNumber:new({r = 2.0, i = -1.5})
    assert_false(complex1 == complex2)
end

function test_inequality_test_between_two_different_complex_numbers_is_expected_to_be_true()    
    local complex1 = fractaljoy.ComplexNumber:new({r = 5.2, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 21.0, i = -7.5})
    assert_true(complex1 ~= complex2)
end

function test_inequality_test_between_two_equal_complex_numbers_is_expected_to_be_false()    
    local complex1 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.0})
    assert_false(complex1 ~= complex2)
end

function test_sum_between_1_1_and_0_0_is_1_1()
    local complex1 = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 0.0, i = 0.0})
    local expected = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    assert_equal(expected, complex1 + complex2)
end

function test_sum_between_arbitrary_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 2.0, i = -1.5})
    local expected = fractaljoy.ComplexNumber:new({r = 3.0, i = -0.5})
    assert_equal(expected, complex1 + complex2)
end

function test_substraction_between_arbitrary_complex_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 2.0, i = -1.5})
    local expected = fractaljoy.ComplexNumber:new({r = -1.0, i = 2.5})
    assert_equal(expected, complex1 - complex2)
end

function test_apply_minus_sign_to_a_complex_number()
    local complex  = fractaljoy.ComplexNumber:new({r = 1.0, i = -1.0})
    local expected = fractaljoy.ComplexNumber:new({r = -1.0, i = 1.0})
    assert_equal(expected, -complex)
end

function test_minus_sign_and_addition_with_complex_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = -2.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 1.0, i = -2.5})
    local expected = fractaljoy.ComplexNumber:new({r = 3.0, i = -3.5})
    assert_equal(expected, complex2 + (-complex1))
end

function test_minus_sign_and_substraction_with_complex_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = 5.0, i = -1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = -1.5, i = -2.5})
    local expected = fractaljoy.ComplexNumber:new({r = 3.5, i = -3.5})
    local result = complex2 - (-complex1)
    assert_equal(expected, complex2 - (-complex1))
end

function test_multiplication_between_arbitrary_complex_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = 2.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 1.0, i = -2.5})
    local expected = fractaljoy.ComplexNumber:new({r = 4.5, i = -4.0})
    assert_equal(expected, complex1 * complex2)
end

function test_division_bewtween_arbitrary_complex_numbers()
    local complex1 = fractaljoy.ComplexNumber:new({r = 3.0, i = -2.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 6.0, i = 4.0})
    local expected = fractaljoy.ComplexNumber:new({r = 10/13, i = 24/13})
    assert_equal(expected, complex2 / complex1)
end

function test_complex_number_squared()
    local complex  = fractaljoy.ComplexNumber:new({r = 3.0, i = 2.0})
    local expected = fractaljoy.ComplexNumber:new({r = 5, i = 12})
    assert_equal(expected, complex^2)
end

function test_complex_number_cubed()
    local complex  = fractaljoy.ComplexNumber:new({r = 3.0, i = 2.0})
    local expected = fractaljoy.ComplexNumber:new({r = -9, i = 46})
    assert_equal(expected, complex^3)
end

function test_complex_number_modulus()
    local complex  = fractaljoy.ComplexNumber:new({r = 2.0, i = -1.0})
    local expected = math.sqrt(5)
    assert_equal(expected, fractaljoy.ComplexNumber:modulus(complex))
end
