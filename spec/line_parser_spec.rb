require_relative '../lib/line_parser'

RSpec.describe LineParser do
  context "PRE loss" do
    it 'changes it for LOSS code' do
      line = "Mk142=Stimulus,S1002,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S111,51542,1,0")
    end

    it 'for B changes it for LOSS code' do
      line = "Mk142=Stimulus,S3008,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S111,51542,1,0")
    end
  end

  context "POST loss" do
    it 'changes it for LOSS code' do
      line = "Mk142=Stimulus,S2002,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S222,51542,1,0")
    end
  end

  context "PRE win" do
    it 'changes it for WIN code' do
      line = "Mk142=Stimulus,S1000,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S333,51542,1,0")
    end

    it 'B changes it for WIN code' do
      line = "Mk142=Stimulus,S3000,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S333,51542,1,0")
    end
  end

  context "POST win" do
    it 'changes it for WIN post code' do
      line = "Mk142=Stimulus,S2000,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S444,51542,1,0")
    end

    it 'B changes it for WIN post code' do
      line = "Mk142=Stimulus,S4000,51542,1,0"

      result = LineParser.call(line)

      expect(result).to eq("Mk142=Stimulus,S444,51542,1,0")
    end
  end
end
