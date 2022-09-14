<?php
namespace app\model;

use think\Model;

class CategoryModel extends Model
{
    protected $name = 'category';

    public function get_all_category()
    {
        return self::field("id,cat_name")->select()->toArray();
    }
}