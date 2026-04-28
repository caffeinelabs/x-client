/// Community Note classification type.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NoteClassification.mo
/// Enum values: #misinformed_or_potentially_misleading, #not_misleading

module {
    public type NoteClassification = {
        #misinformed_or_potentially_misleading;
        #not_misleading;
    };

    public module JSON {
        public func toCandidValue(value : NoteClassification) : Candid.Candid =
            switch (value) {
                case (#misinformed_or_potentially_misleading) #Text("misinformed_or_potentially_misleading");
                case (#not_misleading) #Text("not_misleading");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?NoteClassification =
            switch (candid) {
                case (#Text("misinformed_or_potentially_misleading")) ?#misinformed_or_potentially_misleading;
                case (#Text("not_misleading")) ?#not_misleading;
                case _ null;
            };

        public func toText(value : NoteClassification) : Text =
            switch (value) {
                case (#misinformed_or_potentially_misleading) "misinformed_or_potentially_misleading";
                case (#not_misleading) "not_misleading";
            };
    };
};
