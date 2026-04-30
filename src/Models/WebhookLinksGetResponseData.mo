/// The list of active webhook links for a given stream

import { type WebhookLinksGetResponseDataLinksInner; JSON = WebhookLinksGetResponseDataLinksInner } "./WebhookLinksGetResponseDataLinksInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookLinksGetResponseData.mo

module {
    /// The required-fields slice of WebhookLinksGetResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// list of links
        links : [WebhookLinksGetResponseDataLinksInner];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebhookLinksGetResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type WebhookLinksGetResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a WebhookLinksGetResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookLinksGetResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebhookLinksGetResponseData {
            let ?res = from_candid(to_candid(required)) : ?WebhookLinksGetResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookLinksGetResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("links", #Array(Array.map<WebhookLinksGetResponseDataLinksInner, Candid.Candid>(value.links, WebhookLinksGetResponseDataLinksInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookLinksGetResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?links_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "links") else return null;
                    let ?links = ((switch (links_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<WebhookLinksGetResponseDataLinksInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = WebhookLinksGetResponseDataLinksInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        links;
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
