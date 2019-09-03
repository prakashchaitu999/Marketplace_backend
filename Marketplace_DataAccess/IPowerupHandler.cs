using Marketplace_Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Marketplace_DataAccess
{
    interface IPowerupHandler
    {
        List<Powerups> GetAllPowerups();
    }
}
