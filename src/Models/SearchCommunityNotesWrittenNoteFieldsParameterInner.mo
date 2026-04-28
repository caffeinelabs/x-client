import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SearchCommunityNotesWrittenNoteFieldsParameterInner.mo
/// Enum values: #id, #info, #status, #test_result

module {
    public type SearchCommunityNotesWrittenNoteFieldsParameterInner = {
        #id;
        #info;
        #status;
        #test_result;
    };

    public module JSON {
        public func toCandidValue(value : SearchCommunityNotesWrittenNoteFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#id) #Text("id");
                case (#info) #Text("info");
                case (#status) #Text("status");
                case (#test_result) #Text("test_result");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchCommunityNotesWrittenNoteFieldsParameterInner =
            switch (candid) {
                case (#Text("id")) ?#id;
                case (#Text("info")) ?#info;
                case (#Text("status")) ?#status;
                case (#Text("test_result")) ?#test_result;
                case _ null;
            };

        public func toText(value : SearchCommunityNotesWrittenNoteFieldsParameterInner) : Text =
            switch (value) {
                case (#id) "id";
                case (#info) "info";
                case (#status) "status";
                case (#test_result) "test_result";
            };
    };
};
