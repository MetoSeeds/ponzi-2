require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :players_no => 1,
      :winners_no => 1,
      :open => false,
      :seed => 1,
      :owner_id => 1,
      :cost => 1.5
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_players_no[name=?]", "game[players_no]"
      assert_select "input#game_winners_no[name=?]", "game[winners_no]"
      assert_select "input#game_open[name=?]", "game[open]"
      assert_select "input#game_seed[name=?]", "game[seed]"
      assert_select "input#game_owner_id[name=?]", "game[owner_id]"
      assert_select "input#game_cost[name=?]", "game[cost]"
    end
  end
end
