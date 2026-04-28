import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetListsPostsPollFieldsParameterInner.mo
/// Enum values: #duration_minutes, #end_datetime, #id, #options, #voting_status

module {
    public type GetListsPostsPollFieldsParameterInner = {
        #duration_minutes;
        #end_datetime;
        #id;
        #options;
        #voting_status;
    };

    public module JSON {
        public func toCandidValue(value : GetListsPostsPollFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#duration_minutes) #Text("duration_minutes");
                case (#end_datetime) #Text("end_datetime");
                case (#id) #Text("id");
                case (#options) #Text("options");
                case (#voting_status) #Text("voting_status");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsPostsPollFieldsParameterInner =
            switch (candid) {
                case (#Text("duration_minutes")) ?#duration_minutes;
                case (#Text("end_datetime")) ?#end_datetime;
                case (#Text("id")) ?#id;
                case (#Text("options")) ?#options;
                case (#Text("voting_status")) ?#voting_status;
                case _ null;
            };

        public func toText(value : GetListsPostsPollFieldsParameterInner) : Text =
            switch (value) {
                case (#duration_minutes) "duration_minutes";
                case (#end_datetime) "end_datetime";
                case (#id) "id";
                case (#options) "options";
                case (#voting_status) "voting_status";
            };
    };
};
