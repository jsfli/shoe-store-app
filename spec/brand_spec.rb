require("spec_helper")

describe(Brand) do
  it{should have_and_belong_to_many(:stores)}

  it("capitalize each word in the brand name") do
    test_brand = Brand.create({:name=>"brand1"})
    expect(test_brand.name()).to(eq("Brand1"))
  end
end
