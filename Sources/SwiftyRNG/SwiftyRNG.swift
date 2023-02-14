import CGSL

public class SwiftyRNG {
    let sgsl_rng: UnsafeMutablePointer<gsl_rng>
    public init() {
        sgsl_rng = gsl_rng_alloc(gsl_rng_default)
    }
    public init(seed: UInt) {
        sgsl_rng = gsl_rng_alloc(gsl_rng_default)
        gsl_rng_set(sgsl_rng, seed)
    }
    deinit {
        gsl_rng_free(sgsl_rng)
    }
    public func gaussian(sigma: Double) -> Double {
        return gsl_ran_gaussian(sgsl_rng, sigma)
    }
    public func rayleigh(sigma: Double) -> Double {
        return gsl_ran_rayleigh(sgsl_rng, sigma)
    }
}
