import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// BookmarkFolderPostsResponseMeta.mo

module {
    public type BookmarkFolderPostsResponseMeta = {
        /// The next token.
        next_token : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : BookmarkFolderPostsResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkFolderPostsResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        next_token;
                    };
                };
                case _ null;
            };
    };
};
