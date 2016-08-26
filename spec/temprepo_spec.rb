RSpec.describe RocketmilesPostReport do
  context 'check opt' do
    it 'no RocketMilesPostReport section' do
      conf = SpecConf.new(CONF_RNAME)

      expect do
        conf['post_report'].delete('RocketmilesPostReport')

        RocketmilesPostReport.new(TestOutput.new, conf,
                                  SpecLoggerMaker.logger(conf))
      end.to raise_error("RocketMilesPostReport doesn't found")
    end
