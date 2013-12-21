require "lunit"
local fractaljoy = require "fractaljoy.complex"
module( "complex_test", lunit.testcase )

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

function test_sum_between_1_1_and_0_0_is_1_1( ... )
    local complex1 = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    local complex2 = fractaljoy.ComplexNumber:new({r = 0.0, i = 0.0})
    local expected = fractaljoy.ComplexNumber:new({r = 1.0, i = 1.0})
    local result = complex2 + complex1
    assert_true(result.r == expected.r)
    assert_true(result.i == expected.i)

--    assert_true(expected == complex1 + complex2)
end