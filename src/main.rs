mod lib;
use lib::statistics::*;

use serde_json;
use std::collections::BTreeMap;
use std::fs::File;
use std::io::prelude::*;
use time::PreciseTime;

const TIMES: i32 = 1_0000_0000;

fn main() -> std::io::Result<()> {
    let start = PreciseTime::now();
    let mut map = BTreeMap::new();
    //
    map.insert("sp_single".to_string(), test_sp_single(TIMES));
    map.insert("sp_double".to_string(), test_sp_double(TIMES));
    map.insert("sp_finish".to_string(), test_sp_finish(TIMES));
    map.insert("xd_single".to_string(), test_xd_single(TIMES));
    map.insert("xd_select".to_string(), test_xd_select(TIMES));
    map.insert("xd_double".to_string(), test_xd_double(TIMES));
    map.insert("xd_finish".to_string(), test_xd_finish(TIMES));
    //
    let mut file = File::create("monte_carlo.json")?;
    file.write_all(&serde_json::to_vec(&map)?).unwrap();
    //
    let end = PreciseTime::now();
    println!("finished in {} seconds", start.to(end));
    Ok(())
}
