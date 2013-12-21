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