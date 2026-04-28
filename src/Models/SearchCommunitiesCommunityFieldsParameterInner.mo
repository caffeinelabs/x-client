import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SearchCommunitiesCommunityFieldsParameterInner.mo
/// Enum values: #access, #created_at, #description, #id, #join_policy, #member_count, #name

module {
    public type SearchCommunitiesCommunityFieldsParameterInner = {
        #access;
        #created_at;
        #description;
        #id;
        #join_policy;
        #member_count;
        #name;
    };

    public module JSON {
        public func toCandidValue(value : SearchCommunitiesCommunityFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#access) #Text("access");
                case (#created_at) #Text("created_at");
                case (#description) #Text("description");
                case (#id) #Text("id");
                case (#join_policy) #Text("join_policy");
                case (#member_count) #Text("member_count");
                case (#name) #Text("name");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchCommunitiesCommunityFieldsParameterInner =
            switch (candid) {
                case (#Text("access")) ?#access;
                case (#Text("created_at")) ?#created_at;
                case (#Text("description")) ?#description;
                case (#Text("id")) ?#id;
                case (#Text("join_policy")) ?#join_policy;
                case (#Text("member_count")) ?#member_count;
                case (#Text("name")) ?#name;
                case _ null;
            };

        public func toText(value : SearchCommunitiesCommunityFieldsParameterInner) : Text =
            switch (value) {
                case (#access) "access";
                case (#created_at) "created_at";
                case (#description) "description";
                case (#id) "id";
                case (#join_policy) "join_policy";
                case (#member_count) "member_count";
                case (#name) "name";
            };
    };
};
