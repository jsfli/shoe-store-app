require("spec_helper")

describe(Store) do
  it{should have_and_belong_to_many(:brands)}

  it("capitalize each word in the store name") do
    test_store = Store.create({:name=>"store1"})
    expect(test_store.name()).to(eq("Store1"))
  end
end
