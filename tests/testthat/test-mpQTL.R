

test_that(desc = 'linear model works',
          code = {expect_no_error(map.QTL(
                      phenotypes = mppheno,
                      genotypes = mpsnpdose,
                      ploidy = 4,
                      map = mpmap))
          }
)



