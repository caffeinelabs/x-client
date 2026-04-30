import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetSpacesByIdsTopicFieldsParameterInner.mo
/// Enum values: #description, #id, #name

module {
    public type GetSpacesByIdsTopicFieldsParameterInner = {
        #description;
        #id;
        #name;
    };

    public module JSON {
        public func toCandidValue(value : GetSpacesByIdsTopicFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#description) #Text("description");
                case (#id) #Text("id");
                case (#name) #Text("name");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetSpacesByIdsTopicFieldsParameterInner =
            switch (candid) {
                case (#Text("description")) ?#description;
                case (#Text("id")) ?#id;
                case (#Text("name")) ?#name;
                case _ null;
            };

        public func toText(value : GetSpacesByIdsTopicFieldsParameterInner) : Text =
            switch (value) {
                case (#description) "description";
                case (#id) "id";
                case (#name) "name";
            };
    };
};
