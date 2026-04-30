
import { type GeoType; JSON = GeoType } "./GeoType";

import { type Point; JSON = Point } "./Point";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Geo.mo

module {
    /// The required-fields slice of Geo — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        bbox : [Float];
        properties : Candid.Candid;
        type_ : GeoType;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Geo as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        geometry : ?Point;
    };

    public type Geo = Required and Optional;

    public module JSON {
        // `init` constructs a Geo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Geo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Geo {
            let ?res = from_candid(to_candid(required)) : ?Geo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Geo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("bbox", #Array(Array.map<Float, Candid.Candid>(value.bbox, func(f : Float) : Candid.Candid = #Float(f)))));
            switch (value.geometry) {
                case (?v__) List.add(buf, ("geometry", Point.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("properties", value.properties));
            List.add(buf, ("type", GeoType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Geo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?bbox_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bbox") else return null;
                    let ?bbox = ((switch (bbox_field.1) {
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
                    let geometry : ?Point = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "geometry")) {
                        case (?geometry_field) (Point.fromCandidValue(geometry_field.1));
                        case null null;
                    };
                    let ?properties_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "properties") else return null;
                    let ?properties = (?properties_field.1) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (GeoType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        bbox;
                        geometry;
                        properties;
                        type_;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
