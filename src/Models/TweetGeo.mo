/// The location tagged on the Tweet, if the user provided one.

import { type Point; JSON = Point } "./Point";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetGeo.mo

module {
    /// The required-fields slice of TweetGeo — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetGeo as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        coordinates : ?Point;
        place_id : ?Text;
    };

    public type TweetGeo = Required and Optional;

    public module JSON {
        // `init` constructs a TweetGeo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetGeo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetGeo {
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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
