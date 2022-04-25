shared_examples_for 'an application job' do
  it 'is an ApplicationJob' do
    expect(described_class.new).to be_kind_of(ApplicationJob)
  end
end
