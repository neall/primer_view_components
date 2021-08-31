# frozen_string_literal: true

require "cop_test"

class RubocopPrimerOcticonTest < CopTest
  def cop_class
    RuboCop::Cop::Primer::PrimerOcticon
  end

  def test_primer_octicon
    investigate(cop, <<-RUBY)
      primer_octicon(:icon)
    RUBY

    assert_empty cop.offenses.map(&:message)
  end

  def test_octicon
    investigate(cop, <<-RUBY)
      octicon(:icon)
    RUBY

    assert_correction "primer_octicon(:icon)"
  end

  def test_octicon_with_number_size
    investigate(cop, <<-RUBY)
      octicon(:icon, size: 30)
    RUBY

    assert_correction "primer_octicon(:icon, size: 30)"
  end

  def test_octicon_with_string_size
    investigate(cop, <<-RUBY)
      octicon(:icon, size: '30')
    RUBY

    assert_correction "primer_octicon(:icon, size: 30)"
  end

  def test_octicon_with_px_size
    investigate(cop, <<-RUBY)
      octicon(:icon, size: '30px')
    RUBY

    assert_correction "primer_octicon(:icon, size: 30)"
  end

  def test_octicon_with_invalid_size
    investigate(cop, <<-'RUBY')
      octicon(:icon, size: some_call)
      octicon(:icon, size: "interpolation-#{aux}")
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_number_width
    investigate(cop, <<-RUBY)
      octicon(:icon, width: 30)
    RUBY

    assert_correction "primer_octicon(:icon, width: 30)"
  end

  def test_octicon_with_string_width
    investigate(cop, <<-RUBY)
      octicon(:icon, width: '30')
    RUBY

    assert_correction "primer_octicon(:icon, width: 30)"
  end

  def test_octicon_with_px_width
    investigate(cop, <<-RUBY)
      octicon(:icon, width: '30px')
    RUBY

    assert_correction "primer_octicon(:icon, width: 30)"
  end

  def test_octicon_with_invalid_width
    investigate(cop, <<-'RUBY')
      octicon(:icon, width: some_call)
      octicon(:icon, width: "interpolation-#{aux}")
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_number_height
    investigate(cop, <<-RUBY)
      octicon(:icon, height: 30)
    RUBY

    assert_correction "primer_octicon(:icon, height: 30)"
  end

  def test_octicon_with_string_height
    investigate(cop, <<-RUBY)
      octicon(:icon, height: '30')
    RUBY

    assert_correction "primer_octicon(:icon, height: 30)"
  end

  def test_octicon_with_px_height
    investigate(cop, <<-RUBY)
      octicon(:icon, height: '30px')
    RUBY

    assert_correction "primer_octicon(:icon, height: 30)"
  end

  def test_octicon_with_invalid_height
    investigate(cop, <<-'RUBY')
      octicon(:icon, height: some_call)
      octicon(:icon, height: "interpolation-#{aux}")
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_system_arguments
    investigate(cop, <<-RUBY)
      octicon(:icon, class: "mr-1")
    RUBY

    assert_correction "primer_octicon(:icon, mr: 1)"
  end

  def test_octicon_with_custom_class
    investigate(cop, <<-RUBY)
      octicon(:icon, class: "mr-1 custom")
    RUBY

    assert_correction "primer_octicon(:icon, mr: 1, classes: \"custom\")"
  end

  def test_octicon_with_class_that_cant_be_converted
    investigate(cop, <<-'RUBY')
      octicon(:icon, class: "mr-1 text-center")
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_class_interpolation
    investigate(cop, <<-'RUBY')
      octicon(:icon, class: "mr-1 #{aux}")
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_icon_string
    investigate(cop, <<-RUBY)
      octicon("icon")
    RUBY

    assert_correction "primer_octicon(:icon)"
  end

  def test_octicon_with_icon_block
    investigate(cop, <<-RUBY)
      octicon(some_call ? :icon : :other_icon)
    RUBY

    assert_correction "primer_octicon(some_call ? :icon : :other_icon)"
  end

  def test_octicon_with_unknown_attribute
    investigate(cop, <<-RUBY)
      octicon(:icon, some_attribute: :value)
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_kwargs_as_method_call
    investigate(cop, <<-RUBY)
      octicon(:icon, some_call)
    RUBY

    assert_empty cop.offenses
  end

  def test_octicon_with_aria_attribute
    investigate(cop, <<-RUBY)
      octicon(:icon, "aria-label": "label")
    RUBY

    assert_correction "primer_octicon(:icon, \"aria-label\": \"label\")"
  end

  def test_remove_size
    investigate(cop, <<-RUBY)
      octicon(:icon, size: 10)
    RUBY

    assert_correction "primer_octicon(:icon)"
  end

  def test_medium_size
    investigate(cop, <<-RUBY)
      octicon(:icon, height: 22)
    RUBY

    assert_correction "primer_octicon(:icon, size: :medium)"
  end
end