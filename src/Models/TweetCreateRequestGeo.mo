/// Place ID being attached to the Tweet for geo location.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetCreateRequestGeo.mo

module {
    public type TweetCreateRequestGeo = {
        place_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : TweetCreateRequestGeo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.place_id) {
                case (?v__) List.add(buf, ("place_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestGeo =
            switch (candid) {
                case (#Record(fields)) {
                    let place_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "place_id")) {
                        case (?place_id_field) ((switch (place_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        place_id;
                    };
                };
                case _ null;
            };
    };
};
