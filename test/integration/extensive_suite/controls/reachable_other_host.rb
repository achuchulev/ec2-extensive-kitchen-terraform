control "reachable_other_host" do
    desc "Verifies that the other host is reachable from the current host"
  
    describe host attribute("reachable_other_host_ip_address") do
      it { should be_reachable }
    end
  end