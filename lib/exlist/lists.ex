defmodule Exlist.Lists do
  @moduledoc """ 
  Extension to lists functions
  """

  @doc """
  Flattens the given `list` and returns  the `sum` of those elements

  ## Examples

      iex> Exlist.Lists.flat_sum [1,2,3,4,[5,6,7,[8,9,0]]]
      45
  """
  @spec flat_sum(list(number)) :: number

  def flat_sum(list) when is_list(list) do
    list
    |> List.flatten
    |> list_sum
  end

  @doc """
  Returns the sum of all elements of the list

  ## Examples 

    iex> Exlist.Lists.list_sum [1,2,3,4,,5,6,7,8,9,0]
    45
  """
  @spec list_sum(list) :: number

  def list_sum([head|tail]) do
    head + list_sum(tail)
  end

  @doc false
  def list_sum([]), do: 0

  @doc """
  Returns the given `number` of elements in the `list`. If the number passed is 
  greater than or equal to the length of the list it returns the entire list.               

  How ever you have an option to pass how to get the elements.By default it returns 
  the elements from the first.          

  If you want to get the elements to be returned from the last means you can pass an 
  option  as `:last` . The default option is :first

  ## Examples
  
      iex> Exlist.Lists.list_get([1,2,3,4,5],3)
      [1,2,3]
      iex> Exlist.Lists.list_get([1,2,3,4,5],3,:first)
      [1,2,3]
      iex> Exlist.Lists.list_get([1,2,3,4,5],3,:last)
      [3,4,5]
  """
  @spec list_get(list,integer) :: list

  def list_get(list,num,option \\:first) when is_list(list) do
    if(length(list) <= num) do 
      list
    else
      case option do
        :first ->
          Enum.take(list,num)
        :last ->
          Enum.take(list,-num)
        _->
        IO.puts "option did not mathed"
        end
      end
    end

    @doc """
    adds the given element `elem` to the end of the list `list`

    ## Examples


        iex> Exlist.Lists.append []
        nil

        iex> Exlist.Lists.append [1,2,3],4
        [1,2,3,4]

        iex> Exlist.Lists.append [1,2,3],:atom
        [1,2,3, :atom]

        iex> Exlist.Lists.append [1,2,3],%{name: "john"}
        [1, 2, 3, %{name: "john"}]

    """
    @spec append(list,any) :: list

    def append(list,elem) when not is_list(elem) do
      list ++ [elem]
    end

    @doc false
    def append [] do
      nil
    end

    @doc """
    adds the list to end of the given list as a list or list of items based on the boolean `true` or `false` respectively

    ## Examples

        iex> Exlist.Lists.append [1,2,3],[4,5,6]
        [1,2,3,[4,5,6]]

        iex> Exlist.Lists.append [1,2,3],[4,5,6],:false 
        [1,2,3,[4,5,6]]

        iex> Exlist.Lists.append [1,2,3],[4,5,6], :true
        [1,2,3,4,5,6]

    """
    @spec append(list,list,boolean) ::list

    def append(list1,list2,mode \\ :false) when is_list(list2) do
      case mode do
        :true ->
          list1 ++ list2
        :false ->
          list1 ++ [list2]
      end
    end

    @doc """
    adds the given element `elem` to the begining  of the list `list`

    ## Examples

        iex> Exlist.Lists.prepend []
        nil

        iex> Exlist.Lists.prepend [1,2,3],4
        [4,1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],:atom
        [:atom,1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],%{name: "john"}
        [%{name: "john"},1, 2, 3]

    """
    @spec prepend(list,any) :: list

    def prepend(list,elem) when not is_list(elem) do
      [elem] ++ list
    end

    @doc false
    def prepend [] do
      nil
    end

    @doc """
    adds the list to begining of the given list as a list or list of items
    based on the boolean `true` or `false` respectively

    ## Examples

        iex> Exlist.Lists.prepend [1,2,3],[4,5,6]
        [[4,5,6],1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],[4,5,6],:false 
        [[4,5,6],1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],[4,5,6], :true
        [4,5,6,1,2,3]

    """
    @spec prepend(list,list,boolean) ::list

    def prepend(list1,list2,mode \\ :false) when is_list(list2) do
      case mode do
        :true ->
          list2 ++ list1
        :false ->
          [list2] ++ list1
      end
    end

    @doc """
    Deletes the first `elem` in the given `list`

    ## Examples
        iex> Exlist.Lists.delete_first([1,3,5,7,9])
        [3,5,7,9]
    """
    @spec delete_first([any()]) :: list

    def delete_first([head|tail]), do: tail

    @doc """
    Deletes the last element  in the given `list`

    ## Examples
        iex> Exlist.Lists.delete_last([1,3,5,7,9])
        [1,3,5,7]
    """
    @spec delete_last([any()]) :: list

    def delete_last(list) do
      list
      |> List.delete_at(-1)
    end

    @doc """
    Deletes the elements after the given `elem` in the given `list`

    ## Examples
        iex> Exlist.Lists.delete_after([1,2,3,4,5],2)
        [1,2]
        iex> Exlist.Lists.delete_after([1,2,3,4,5],10)
        [1,2,3,4,5]
        iex> Exlist.Lists.delete_after([1,2,[9,5],3,4,5],[9,5])
        [1,2,[9,5]]
        iex> Exlist.Lists.delete_after([1,2,%{type: :numbers},3,4,5],%{type: :numbers})
        [1,2,%{type: :numbers}]
    """
    @spec delete_after(list,any)::list

    def delete_after list,elem do 
      index = index_of(list,elem)
      case index do
        nil -> 
          list
        value ->
          list
          |> Enum.split(value + 1)
          |> elem(0)
      end
    end

    @doc """
    Deletes the elements before the given `elem` in the given `list`

    ## Examples
        iex> Exlist.Lists.delete_before([1,2,3,4,5],2)
        [2,3,4,5]
        iex> Exlist.Lists.delete_before([1,2,3,4,5],10)
        [1,2,3,4,5]
        iex> Exlist.Lists.delete_before([1,2,[9,5],3,4,5],[9,5])
        [[9,5],3,4,5]
        iex> Exlist.Lists.delete_before([1,2,%{type: :numbers},3,4,5],%{type: :numbers})
        [%{type: :numbers},3,4,5]
    """
    @spec delete_before(list,any)::list

    def delete_before list,elem do 
      index = index_of(list,elem)
      case index do
        nil -> 
          list
        value ->
          list
          |> Enum.split(value)
          |> elem(1)
      end
    end

    @doc """
    Returns the first occurrence of the `elem` in the list. Even if the multiple elements of 
    same type presents, it returns only the first occurrence of the `elem`.       
    If the element is not present in the list then it returns the `nil`

    ## Examples

        iex> Exlist.Lists.index_of [1,2,3,4,5],4
        3
        iex> Exlist.Lists.index_of [1,2,3,4,5],33
        nil
        iex> Exlist.Lists.index_of [1,2,3,3,4,3,5],3
        2
    """
    @spec index_of(list,any) :: integer

    def index_of list,elem do 
      list
      |> indexes(elem)
      |> List.first()
    end

    @doc """
    Returns the all occurrence of the `elem` in the `list` in the form list
    If the element is not present in the list then it returns empty list`[]`

    ## Examples
    
        iex> Exlist.Lists.indexes [1,2,3,4,5],4
        [3]
        iex> Exlist.Lists.indexes [1,2,3,4,5],33
        []
        iex> Exlist.Lists.indexes [1,2,3,3,4,3,5],3
        [2,3,5]
    """

    def indexes list,elem do
      list
      |> Enum.with_index() 
      |> Enum.filter_map(fn {x, _} -> x == elem end, fn {_, i} -> i end)
    end
    

end

