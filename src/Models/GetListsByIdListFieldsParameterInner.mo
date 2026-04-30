import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetListsByIdListFieldsParameterInner.mo
/// Enum values: #created_at, #description, #follower_count, #id, #member_count, #name, #owner_id, #private_

module {
    public type GetListsByIdListFieldsParameterInner = {
        #created_at;
        #description;
        #follower_count;
        #id;
        #member_count;
        #name;
        #owner_id;
        #private_;
    };

    public module JSON {
        public func toCandidValue(value : GetListsByIdListFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#created_at) #Text("created_at");
                case (#description) #Text("description");
                case (#follower_count) #Text("follower_count");
                case (#id) #Text("id");
                case (#member_count) #Text("member_count");
                case (#name) #Text("name");
                case (#owner_id) #Text("owner_id");
                case (#private_) #Text("private");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsByIdListFieldsParameterInner =
            switch (candid) {
                case (#Text("created_at")) ?#created_at;
                case (#Text("description")) ?#description;
                case (#Text("follower_count")) ?#follower_count;
                case (#Text("id")) ?#id;
                case (#Text("member_count")) ?#member_count;
                case (#Text("name")) ?#name;
                case (#Text("owner_id")) ?#owner_id;
                case (#Text("private")) ?#private_;
                case _ null;
            };

        public func toText(value : GetListsByIdListFieldsParameterInner) : Text =
            switch (value) {
                case (#created_at) "created_at";
                case (#description) "description";
                case (#follower_count) "follower_count";
                case (#id) "id";
                case (#member_count) "member_count";
                case (#name) "name";
                case (#owner_id) "owner_id";
                case (#private_) "private";
            };
    };
};
