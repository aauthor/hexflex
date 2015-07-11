require "spec_helper"
require "hexflex"

describe Hexflex do
  describe "constants setup" do
    it "sets the radius" do
      expect(Hexflex::RADIUS).to eq 1
    end
    it "set the base of a triangle" do
      expect(Hexflex::BASE).to eq Math::sqrt(3)
    end
    it "sets half the base of a triangle" do
      expect(Hexflex::HALF_BASE).to eq(Math::sqrt(3)/2)
    end
    it "sets the height of the triangle" do
      expect(Hexflex::HEIGHT).to eq(1.5)
    end
    it "sets the height of the triangle minus the radius" do
      expect(Hexflex::HEIGHT_AFTER_RADIUS).to eq(Hexflex::HEIGHT - Hexflex::RADIUS)
    end
  end

  describe "#make_template_image" do
    let(:hexaflexagon) { double(:hexaflexagon) }
    let(:template) { double(:template) }
    let(:filename) { "lets_flex.png" }
    let(:side_fills) { [:red, :white, :blue] }
    it "creates a and save a hexaflexagon template" do
      expect(Hexflex::Hexaflexagon).to receive(:new)
        .with(side_fills: side_fills).and_return(hexaflexagon)
      expect(hexaflexagon).to receive(:as_template).and_return(template)
      expect(template).to receive(:save).with(filename)
      subject.make_template_image(
        output_file_name: filename,
        side_fills: side_fills
      )
    end

  end
end
