import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// BookmarkMutationResponseData.mo

module {
    public type BookmarkMutationResponseData = {
        bookmarked : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : BookmarkMutationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.bookmarked) {
                case (?v__) List.add(buf, ("bookmarked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkMutationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let bookmarked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bookmarked")) {
                        case (?bookmarked_field) ((switch (bookmarked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        bookmarked;
                    };
                };
                case _ null;
            };
    };
};
