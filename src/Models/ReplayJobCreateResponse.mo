/// Confirmation that the replay job request was accepted.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ReplayJobCreateResponse.mo

module {
    public type ReplayJobCreateResponse = {
        /// The UTC timestamp indicating when the replay job was created.
        created_at : Text;
        /// The unique identifier for the initiated replay job.
        job_id : Text;
    };

    public module JSON {
        // `init` constructs a ReplayJobCreateResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ReplayJobCreateResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            created_at : Text;
            job_id : Text;
        }) : ReplayJobCreateResponse {
            let ?res = from_candid(to_candid(required)) : ?ReplayJobCreateResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ReplayJobCreateResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created_at", #Text(value.created_at)));
            List.add(buf, ("job_id", #Text(value.job_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ReplayJobCreateResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at") else return null;
                    let ?created_at = ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?job_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "job_id") else return null;
                    let ?job_id = ((switch (job_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        created_at;
                        job_id;
                    };
                };
                case _ null;
            };
    };
};
