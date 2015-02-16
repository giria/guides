describe SomeClass do
  describe "#let" do
    let(:user) { User.new(name: "John") }

    context "avoid using" do
      it "uses lets" do
        # BAD
        user.name = "Jane"
        result = SomeClass.new(user).run

        expect(result).to be_present
      end

      it "does not use lets" do
        # GOOD
        user = build_user(name: "Jane")

        result = SomeClass.new(user).run

        expect(result).to be_present
      end
    end

    context "don't re-implement" do
      it "uses a re-implementation of let" do
        some_variable

        expect(true).to be_true
      end

      def some_variable
        # BAD -- just use let, or better extract a function that allows passing
        # the thing that is different accross the examples.
        @some_variable ||= "some_variable"
      end
    end
  end
end
