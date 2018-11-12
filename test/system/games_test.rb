require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

    # test "visiting /new renders the form" do
    #   visit ask_url
    #   assert_selector "p", text: "Ask your coach anything"
    # end

    # test "saying dfasdkanf yields word not found" do
    #   visit new_url
    #   fill_in "word", with: "dfasdkanf"
    #   click_on "Play"

    #   assert_text "Sorry but dfasdkanf can't be build out of #{letters.join(", ")}!"
    # end

  end
