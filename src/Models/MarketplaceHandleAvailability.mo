import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MarketplaceHandleAvailability.mo

module {
    public type MarketplaceHandleAvailability = {
        /// Availability state of the handle.
        availability_state : Text;
        /// Redirect URL for marketplace handle search.
        redirect_url : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : MarketplaceHandleAvailability) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("availability_state", #Text(value.availability_state)));
            switch (value.redirect_url) {
                case (?v__) List.add(buf, ("redirect_url", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MarketplaceHandleAvailability =
            switch (candid) {
                case (#Record(fields)) {
                    let ?availability_state_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "availability_state") else return null;
                    let ?availability_state = ((switch (availability_state_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let redirect_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "redirect_url")) {
                        case (?redirect_url_field) ((switch (redirect_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        availability_state;
                        redirect_url;
                    };
                };
                case _ null;
            };
    };
};
