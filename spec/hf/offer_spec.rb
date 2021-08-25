# frozen_string_literal: true

RSpec.describe Hf::Api::Offer do
  describe '#new_offer' do
    subject { described_class.new }

    context 'when request is successful' do
      before do
        allow(subject).to receive(:new_offer).with(
          loan_amount: 350000,
          property_value: 350000,
          repayment: 1.0,
          years_fixed: 15
        ).and_return(
          status: 200,
          body: {
            'data' => {
              'cached' => false,
              'offers' => [
                {
                  'institution_name' => 'ING_DIBA',
                  'borrowing_rate' => 1.48
                }
              ]
            }
          }
        )
      end

      it 'returns an array of offers' do
        offers = subject.new_offer(
          loan_amount: 350000,
          property_value: 350000,
          repayment: 1.0,
          years_fixed: 15
        )
        expect(offers.dig(:body, 'data', 'offers')).to be_an(Array)
        expect(offers[:status]).to eq(200)
      end
    end

    context 'when request is unsuccessful' do
      before do
        allow(subject).to receive(:new_offer).with(
          loan_amount: 350000,
          property_value: 0,
          repayment: 1.0,
          years_fixed: 15
        ).and_raise(
          Hf::Api::OfferError
        )
      end

      it 'returns an error message' do
        expect do
          subject.new_offer(
            loan_amount: 350000,
            property_value: 0,
            repayment: 1.0,
            years_fixed: 15
          )
        end.to raise_error(Hf::Api::OfferError)
      end
    end
  end
end
