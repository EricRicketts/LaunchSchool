require_relative './cli_constants'

class TableFormat
  include CliConstants
  OFFSET = 2

  attr_accessor :fields, :values, :sum

  def gather_data(result_obj, fields, values)
    @sum = result_obj.field_values(AMOUNT).sum(&:to_f)
    @fields = init_fields_hsh(fields, result_obj)
    @values = values
  end

  def print_table
    print_fields << print_values << print_total
  end

  private

  def associate_values_with_spacings
    spacings = fields.values
    values.map do |record|
      record.map.with_index do |str, idx|
        [str, spacings[idx]]
      end.to_h
    end
  end

  def format_values(values_with_spacings)
    values_with_spacings.inject([]) do |record, hsh|
      record << hsh.inject([]) do |str, (value, spacing)|
        str << value.rjust(spacing)
      end.join('|')
    end.join("\n").concat("\n")
  end

  def gen_separator
    fields.inject([]) do |str, (_, spacing)|
      str << '-' * spacing
    end.join('+').concat("\n")
  end

  def init_fields_hsh(field_names, result_obj)
    permutes = field_names.permutation(field_names.size).entries
    ordered_fields = permutes.select do |ary|
      ary == DESIRED_ORDER
    end.flatten

    ordered_fields.to_h do |name|
      [name, result_obj.field_values(name).map(&:length).max + OFFSET]
    end
  end

  def gen_field_names
    fields.inject([]) do |columns, (name, spacing)|
      columns << name.rjust(spacing)
    end.join('|').concat("\n")
  end

  def print_fields
    gen_field_names << gen_separator
  end

  def print_total
    table_header = gen_field_names
    sub_amount_value = table_header.gsub(/#{AMOUNT}/, sum.to_s.rjust(AMOUNT.length))
    cleared_string = sub_amount_value.gsub(/[[:alpha:]|_]/, "\s")
    total_line = cleared_string.gsub(/^\s{5}/, 'Total')
    gen_separator.gsub(/\+/, '-') << total_line
  end

  def print_values
    values_with_spacings = associate_values_with_spacings
    format_values(values_with_spacings)
  end
end
