class LineParser
  class << self
    WIN_CODE = "333"
    POST_WIN_CODE = "444"

    LOSS_CODE = "111"
    LOSSES = %w[
      1002
      1004
      1006
      1008
      1009
      1011
      1013
      1014
      1016
      1017
      1020
      1022
      1024
      1025
      1026
      1030
      1032
      1033
      1036
      1037
      3008
    ]

    POST_LOSS_CODE = "222"
    POST_LOSSES = %w[
      2002
    ]

    def call(line)
      code = stimulus_code(line)

      if LOSSES.include?(code)
        return line.gsub(/S\s*\K(\d+)/, LOSS_CODE)
      end

      if POST_LOSSES.include?(code)
        return line.gsub(/S\s*\K(\d+)/, POST_LOSS_CODE)
      end

      code_first_num = code.chars.first
      if %w[1 3 5 7].include?(code_first_num)
        return line.gsub(/S\s*\K(\d+)/, WIN_CODE)
      end

      if %w[2 4 6 8].include?(code_first_num)
        return line.gsub(/S\s*\K(\d+)/, POST_WIN_CODE)
      end
    end

    def stimulus_code(line)
      line.match(/S\s*\K(\d+)/)[0]
    end
  end

end
