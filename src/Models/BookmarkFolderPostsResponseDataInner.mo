import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// BookmarkFolderPostsResponseDataInner.mo

module {
    public type BookmarkFolderPostsResponseDataInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : BookmarkFolderPostsResponseDataInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkFolderPostsResponseDataInner =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        id;
                    };
                };
                case _ null;
            };
    };
};
