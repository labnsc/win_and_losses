class LineParser
  class << self
    WIN_CODE = '333'.freeze
    POST_WIN_CODE = '444'.freeze

    LOSS_CODE = '111'.freeze
    LOSSES = %w(
      1002
    ).freeze

    POST_LOSS_CODE = '222'.freeze
    POST_LOSSES = %w(
      2002
    ).freeze

    def call(line)
      code = stimulus_code(line)

      return line.gsub(/S\s*\K(\d+)/, LOSS_CODE) if LOSSES.include?(code)

      if POST_LOSSES.include?(code)
        return line.gsub(/S\s*\K(\d+)/, POST_LOSS_CODE)
      end

      code_number = code.to_i
      if code_number >= 1000 && code_number < 2000
        return line.gsub(/S\s*\K(\d+)/, WIN_CODE)
      end

      if code_number >= 2000 && code_number < 3000
        return line.gsub(/S\s*\K(\d+)/, POST_WIN_CODE)
      end
    end

    def stimulus_code(line)
      line.match(/S\s*\K(\d+)/)[0]
    end
  end
end
