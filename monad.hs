import Control.Applicative
import Control.Monad


data Possibly a = Fuck | Simply a


instance (Show a) => Show (Possibly a) where
    show (Simply x) = "Simply " ++ show x
    show Fuck = "Fuck"


instance (Eq a) => Eq (Possibly a) where
    Simply x == Simply y = (x == y)
    Fuck == Fuck = True
    _ == _ = False


instance (Ord a) => Ord (Possibly a) where
    Fuck > Fuck = False
    Simply x > Fuck = True
    Simply x > Simply y = x > y
    x < y = not (x > y) && not (x == y)
    x <= y = (x < y) || (x == y)


instance (Num a) => Num (Possibly a) where
    Simply x + Simply y = Simply (x + y)
    _ + _               = Fuck

    Simply x * Simply y = Simply (x * y)
    _ * _               = Fuck

    Simply x - Simply y = Simply (x - y)
    _ - _               = Fuck

    negate (Simply x)   = Simply (negate x)
    negate _            = Fuck

    abs (Simply x)      = Simply (abs x)
    abs _               = Fuck

    signum (Simply x)   = Simply (signum x)
    signum _            = Fuck

    fromInteger _  = Fuck


instance Functor Possibly where
    fmap f Fuck = Fuck
    fmap f (Simply x) = Simply (f x)


instance Applicative Possibly where
    pure f = Simply f
    (Simply f) <*> (Simply x) = Simply (f x)


instance Monad Possibly where
    return x = Simply x
    (Simply x) >>= f = f x
