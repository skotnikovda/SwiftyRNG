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
    public func normal(mu: Double, sigma: Double) -> Double {
        return mu + gsl_ran_gaussian(sgsl_rng, sigma)
    }
    public func rayleigh(sigma: Double) -> Double {
        return gsl_ran_rayleigh(sgsl_rng, sigma)
    }
    public func exponential(mu: Double) -> Double {
        return gsl_ran_exponential(sgsl_rng, mu)
    }
    public func weibull(a: Double, b: Double) -> Double {
        return gsl_ran_weibull(sgsl_rng, a, b)
    }
    public func uniform(a: Double, b: Double) -> Double {
        return gsl_ran_flat(sgsl_rng, a, b)
    }
}
