/// A [GeoJson Point](https://tools.ietf.org/html/rfc7946#section-3.1.2) geometry object.

import { type PointType; JSON = PointType } "./PointType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Point.mo

module {
    /// The required-fields slice of Point — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A [GeoJson Position](https://tools.ietf.org/html/rfc7946#section-3.1.1) in the format `[longitude,latitude]`.
        coordinates : [Float];
        type_ : PointType;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Point as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type Point = Required and Optional;

    public module JSON {
        // `init` constructs a Point from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Point.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Point {
            let ?res = from_candid(to_candid(required)) : ?Point else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Point) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("coordinates", #Array(Array.map<Float, Candid.Candid>(value.coordinates, func(f : Float) : Candid.Candid = #Float(f)))));
            List.add(buf, ("type", PointType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Point =
            switch (candid) {
                case (#Record(fields)) {
                    let ?coordinates_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "coordinates") else return null;
                    let ?coordinates = ((switch (coordinates_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let ?f__ = (switch (c__) { case (#Float(g)) ?g; case (#Int(j)) ?Float.fromInt(j); case (#Nat(k)) ?Float.fromInt(k); case _ null }) else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (PointType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        coordinates;
                        type_;
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
