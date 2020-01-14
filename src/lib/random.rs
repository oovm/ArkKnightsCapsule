use rand::Rng;

pub fn sp_single() -> i32 {
    //任何一个六星
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let mut six = 0;
    while six < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.5 {
                six += 1;
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn sp_double() -> i32 {
    // 双六星
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let (mut six_1, mut six_2) = (0, 0);
    while six_1 < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.5 {
                six_1 += 1;
            }
        }

        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    while six_2 < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.5 {
                six_2 += 1;
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn sp_finish() -> i32 {
    // 双六星满潜
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let (mut six_1, mut six_2) = (0, 0);
    while six_1 < 6 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.5 {
                six_1 += 1;
            }
        }

        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    while six_2 < 6 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.5 {
                six_2 += 1;
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn xd_single() -> i32 {
    //任意六星
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let mut six = 0;
    while six < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.7 {
                six += 1;
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn xd_select() -> i32 {
    // 给定六星
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let mut six = 0;
    while six < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.35 {
                six += 1;
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn xd_double() -> i32 {
    // 双六星
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let (mut six_1, mut six_2) = (0, 0);
    while six_1 < 1 || six_2 < 1 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.35 {
                six_1 += 1
            } else if r <= p * 0.7 {
                six_2 += 1
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}

pub fn xd_finish() -> i32 {
    // 双满潜
    let mut p = 0.02;
    let mut rng = rand::thread_rng();
    let (mut m, mut n) = (0, 1);
    let (mut six_1, mut six_2) = (0, 0);
    while six_1 < 6 || six_2 < 6 {
        let r = rng.gen_range(0.0, 1.0);
        m += 1;
        if r > p {
            n += 1
        } else {
            n = 1;
            if r <= p * 0.35 {
                six_1 += 1
            } else if r <= p * 0.7 {
                six_2 += 1
            }
        }
        if n <= 50 {
            p = 0.02
        } else {
            p = 0.02 * (n - 50) as f32 + 0.02
        }
    }
    return m;
}
