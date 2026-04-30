/// The location tagged on the Tweet, if the user provided one.

import { type Point; JSON = Point } "./Point";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetGeo.mo

module {
    public type TweetGeo = {
        coordinates : ?Point;
        /// The identifier for this place.
        place_id : ?Text;
    };

    public module JSON {
        // `init` constructs a TweetGeo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetGeo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetGeo {
            let ?res = from_candid(to_candid(required)) : ?TweetGeo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetGeo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.coordinates) {
                case (?v__) List.add(buf, ("coordinates", Point.toCandidValue(v__)));
                case null ();
            };
            switch (value.place_id) {
                case (?v__) List.add(buf, ("place_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetGeo =
            switch (candid) {
                case (#Record(fields)) {
                    let coordinates : ?Point = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "coordinates")) {
                        case (?coordinates_field) (Point.fromCandidValue(coordinates_field.1));
                        case null null;
                    };
                    let place_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "place_id")) {
                        case (?place_id_field) ((switch (place_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        coordinates;
                        place_id;
                    };
                };
                case _ null;
            };
    };
};
