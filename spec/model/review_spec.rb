require 'rails_helper'

describe Review do
  describe "email receive" do
    email = {
      # from: "roy@#{name}.com",
      title: "any title",
      body: "very long long long body",
      score: 3
    }

    context "creating a new company" do
      context "real company" do
        before do
          name = 'simplee'
          email[:from] = "roy@#{name}.com"
          review = Review.new(email: email)
          review.save!
        end

        it "should create a new company and fetch metadata" do
          company = Company.where('lower(name) = ?', name.downcase).first
          expect(company.name.downcase).to eq(name.downcase)
          expect(company.number_of_reviews).to eq(1)
          expect(company.controversy).to eq(0)
          expect(company.rating).to eq(3)
          expect(company.description).to be_truthy
          expect(company.metadata).to be_truthy
        end
      end

      context "fake company" do
        before do
          name = 'simplaljsdlasjdlakjljkee'
          email[:from] = "roy@#{name}.com"
          review = Review.new(email: email)
          review.save!
        end

        it "should create a new company and fail to fetch metadata" do
          company = Company.where('lower(name) = ?', name.downcase).first
          expect(company.name.downcase).to eq(name.downcase)
          expect(company.number_of_reviews).to eq(1)
          expect(company.controversy).to eq(0)
          expect(company.rating).to eq(3)
          expect(company.description).to be_falsey
          expect(company.metadata).to be_falsey
        end
      end
    end

    describe "already existing company" do
      before(:all) do
        name = "Microsoft"
        @company = Company.new
        @company.name = name
        @company.number_of_reviews = 0
        @company.controversy = 0
        @company.rating = 0
        @company.description = "Biggest software company in the world"
        @company.metadata = nil
        @company.save!
      end
      describe "real company" do
        before do
          email[:from] = "roy@#{name}.com"
          review = Review.new(email: email)
          review.save!
        end

        it "should create a new company and fetch metadata" do
          company = Company.where('lower(name) = ?', name.downcase).first
          expect(company.name.downcase).to eq(@company.name.downcase)
          expect(company.number_of_reviews).to eq(@company.number_of_reviews + 1)
          expect(company.controversy).to eq(@company.controversy)
          expect(company.rating).to eq(3)
          expect(company.description).to eq(@company.description)
          expect(company.metadata).to eq(@company.metadata)
        end
      end
      # describe "real company" do
      #   before do
      #     email = {
      #       from: "roy@#{name}.com",
      #       title: "any title",
      #       body: "very long long long body",
      #       score: 3
      #     }
      #     review = Review.new(email: email)
      #     review.save!
      #   end

      #   it "should create a new company and fetch metadata" do
      #     company = Company.where('lower(name) = ?', name.downcase).first
      #     expect(company.name.downcase).to eq(name.downcase)
      #     expect(company.number_of_reviews).to eq(1)
      #     expect(company.controversy).to eq(0)
      #     expect(company.rating).to eq(3)
      #     expect(company.description).to be_truthy
      #     expect(company.metadata).to be_truthy
      #   end
      # end
    end
    describe "multiple reviews from same sender" do
      it "should reject reviews after the first one" do

      end
    end
  end
end