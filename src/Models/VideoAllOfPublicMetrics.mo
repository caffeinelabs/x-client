/// Engagement metrics for the Media at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// VideoAllOfPublicMetrics.mo

module {
    public type VideoAllOfPublicMetrics = {
        /// Number of times this video has been viewed.
        view_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : VideoAllOfPublicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.view_count) {
                case (?v__) List.add(buf, ("view_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?VideoAllOfPublicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let view_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "view_count")) {
                        case (?view_count_field) ((switch (view_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        view_count;
                    };
                };
                case _ null;
            };
    };
};
