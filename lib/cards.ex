defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """


  @doc """
  Returns a list of strings represeting playing cards

  """



  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
     for value <- values , suit <- suits do

        "#{value} of #{suit}"

    end

  end



  def shuffle(deck) do
    Enum.shuffle(deck)

  end
   @doc """
   Determines whether a deck contains a card

   ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains(deck ,"Ace of Hearts")
      true




  """

  def contains(deck , card) do
      Enum.member?(deck, card)
  end

  @doc """
   Divides a deck into a deck ad the remainder of the deck
   The `hand size ` argument indicates how many cards should be in the hand.
   ## Examples
      iex> deck = Cards.create_deck
      iex> {hand , deck} = Cards.deal(deck, 1)
      iex>hand
      ["Ace of Hearts"]




  """

  def deal(deck , hand_size) do
    Enum.split(deck , hand_size)

  end

  def save(deck , filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename ,  binary)
  end

  def load(filename) do
    {status , binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "This file does not exist"


    end
  end
# pipe operator - takes the result from up and takes consistent first arguments

  def create_hand(hand_size) do


      Cards.create_deck
      |>Cards.shuffle
      |>Cards.deal(hand_size)


  end







end
