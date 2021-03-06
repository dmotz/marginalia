module Model exposing
    ( Author
    , Entry
    , Filter(..)
    , Id
    , InputFocus(..)
    , Model
    , StoredModel
    , Tag
    , Title
    , filterToString
    , initialModel
    , initialStoredModel
    , stringToFilter
    )

import Dict exposing (Dict)
import InfiniteList as IL
import Set exposing (Set)


type Filter
    = TitleFilter
    | AuthorFilter
    | TagFilter
    | TextFilter


type InputFocus
    = NoteFocus
    | TagFocus
    | SearchFocus


type alias Id =
    String


type alias Title =
    String


type alias Author =
    String


type alias Tag =
    String


type alias Entry =
    { id : Id
    , text : String
    , title : Title
    , author : String
    , page : Maybe Int
    , tags : List Tag
    , notes : String
    }


type alias Model =
    { entries : List Entry
    , idsToEntries : Dict Id Entry
    , neighborMap : Dict Id (List ( Entry, Float ))
    , shownEntries : Maybe (List Entry)
    , hiddenEntries : Set Id
    , selectedEntries : List Entry
    , completedEmbeddings : Set Id
    , embeddingsReady : Bool
    , titles : List Title
    , authors : List Author
    , tags : List Tag
    , filterType : Filter
    , filterValue : Maybe String
    , pendingTag : Maybe Tag
    , focusMode : Bool
    , aboutMode : Bool
    , isDragging : Bool
    , reverseList : Bool
    , hidePromptActive : Bool
    , inputFocused : Maybe InputFocus
    , parsingError : Bool
    , uiSize : ( Int, Int )
    , infiniteList : IL.Model
    , schemaVersion : Int
    }


initialModel : Model
initialModel =
    { entries = []
    , idsToEntries = Dict.empty
    , neighborMap = Dict.empty
    , shownEntries = Nothing
    , hiddenEntries = Set.empty
    , selectedEntries = []
    , completedEmbeddings = Set.empty
    , embeddingsReady = False
    , titles = []
    , authors = []
    , tags = []
    , filterType = TitleFilter
    , filterValue = Nothing
    , pendingTag = Nothing
    , focusMode = False
    , aboutMode = False
    , isDragging = False
    , reverseList = False
    , hidePromptActive = False
    , inputFocused = Nothing
    , parsingError = False
    , uiSize = ( 1, 1 )
    , infiniteList = IL.init
    , schemaVersion = 0
    }


type alias StoredModel =
    { entries : List Entry
    , selectedEntries : List Id
    , hiddenEntries : List Id
    , filterType : String
    , filterValue : Maybe String
    , focusMode : Bool
    , reverseList : Bool
    , schemaVersion : Int
    }


initialStoredModel : StoredModel
initialStoredModel =
    { entries = []
    , selectedEntries = []
    , hiddenEntries = []
    , filterType = filterToString initialModel.filterType
    , filterValue = initialModel.filterValue
    , focusMode = initialModel.focusMode
    , reverseList = initialModel.reverseList
    , schemaVersion = initialModel.schemaVersion
    }


stringToFilter : String -> Filter
stringToFilter s =
    case s of
        "title" ->
            TitleFilter

        "author" ->
            AuthorFilter

        "tag" ->
            TagFilter

        _ ->
            TextFilter


filterToString : Filter -> String
filterToString f =
    case f of
        TitleFilter ->
            "title"

        AuthorFilter ->
            "author"

        TagFilter ->
            "tag"

        _ ->
            "text"
