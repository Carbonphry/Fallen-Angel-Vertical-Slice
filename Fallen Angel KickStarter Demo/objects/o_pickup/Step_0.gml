z_ += z__speed_;
z__speed_ += gravity_; 
if z_ >= 0 
{
	can_pickup_ = true;
	var _bounce_amount = 0.25;
	z__speed_ = -z__speed_ * _bounce_amount;
	
	if z__speed_ > -1
	{
		z__speed_ = 0;
		z_ = 0;
	}
}