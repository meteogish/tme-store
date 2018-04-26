using System;
using System.Collections.Generic;
using System.Text;
using TME.Domain.Models;

namespace TME.Domain.Components
{
    public interface IConfigurationProvider
    {
        ApiConfiguration ApiConfiguration { get; }
    }
}
