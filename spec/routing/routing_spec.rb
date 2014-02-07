require 'spec_helper'

describe 'RoutingSpec' do

  it 'should route the mark_as_read action' do
    {:get => "/mark_as_read/foo/1.gif"}.should route_to(
        :controller => "mark_as_read/mark_as_read",
        :action => 'read',
        :type => 'foo',
        :id => "1"
      )
    end
end